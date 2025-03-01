#!/bin/bash

# Specify the module to test (e.g "HSL")
julia -E 'using Pkg; module_name = "QuadraticModelsXpress"; Pkg.activate("test_env"); Pkg.develop(PackageSpec(url=joinpath("."))); Pkg.build(module_name); Pkg.test(module_name)' &> "$org"_"$repo"_"$pullrequest".txt

# Create the gist and create comment on PR:
julia test/send_gist_url.jl
