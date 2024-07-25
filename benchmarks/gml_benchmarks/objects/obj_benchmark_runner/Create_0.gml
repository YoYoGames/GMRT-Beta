

benchmarks = GetBenchmarks();

output = "";

for(var i=0; i<array_length(benchmarks); i++) {
	var b = benchmarks[i];
	output += "Running benchmark " + b.name + "...\n";
	var result = b.run(1);
	output += "Executed in " + string(result.milliseconds) + "ms\n";
	output += "Produced output: " + string(result.output) + "\n\n";
}

show_debug_message(output)
