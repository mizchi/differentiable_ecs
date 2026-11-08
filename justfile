target := "js"

default:
    @just --list

fmt:
    moon fmt
    for dir in examples/*; do moon -C "$dir" fmt; done

check:
    moon check --target {{target}} --deny-warn
    for dir in examples/*; do if [ "{{target}}" != "js" ] && grep -q '^supported_targets = "js"$' "$dir/moon.mod"; then continue; fi; moon -C "$dir" check --target {{target}} --deny-warn || exit; done

test:
    moon test --target {{target}} --deny-warn

package: check
    moon package

publish-check: package
    moon publish --dry-run
