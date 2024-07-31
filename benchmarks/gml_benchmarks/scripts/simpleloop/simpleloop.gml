
function simple_loop(n, inc) {
    var i = 0;
	while(i < n) {
		i += inc
	}
	return i;
}

function RunSimpleLoopBenchmark(scale_n) {

	var milliseconds = 0;
    
	var n = round(100000000 * scale_n);
	
    var startTime = current_time;
    
    var output = simple_loop(n, 1);
    
    milliseconds = current_time - startTime;
		
	return {
		milliseconds: milliseconds,
		output: output,
	};
}

global.simpleloop_benchmark = {
	run: RunSimpleLoopBenchmark,
	name: "simple-loop",
}