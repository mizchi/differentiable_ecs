///|
test "tune converges and repeats with a fixed seed" {
  let specs : Array[@differentiable_ecs.ParamSpec] = [
    { name: "x", initial: 4.0, min: -10.0, max: 10.0, },
    { name: "y", initial: -3.0, min: -10.0, max: 10.0, },
  ]
  let targets : Array[@differentiable_ecs.BalanceTarget] = [
    { metric: "x", target: 1.0, weight: 1.0, },
    { metric: "y", target: 2.0, weight: 1.0, },
  ]
  let config = {
    ..@differentiable_ecs.TuneConfig::default(specs, targets),
    max_generations: 80,
    log_interval: 0,
  }
  let simulate = fn(params : Array[Double], _seed : Int32) {
    let metrics = @differentiable_ecs.Metrics::new()
    metrics.set("x", params[0])
    metrics.set("y", params[1])
    metrics
  }
  let first = @differentiable_ecs.tune(config, simulate)
  let second = @differentiable_ecs.tune(config, simulate)
  assert_true(first.loss < 0.000001)
  assert_eq(first.params, second.params)
  assert_eq(first.loss, second.loss)
  assert_eq(first.generation, 80)
  assert_eq(first.metrics.get("x"), first.params[0])
  assert_eq(first.metrics.get("y"), first.params[1])
}
