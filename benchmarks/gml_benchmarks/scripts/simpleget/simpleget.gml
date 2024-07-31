
function simple_get(n, inc) {
    var i = 0;
	while(i < n.v) {
		i += inc.v
	}
	return i;
}

function RunSimpleGetBenchmark(scale_n) {

	var milliseconds = 0;
    
	var n = round(100000000 * scale_n);
	
    var startTime = current_time;
    
    var output = simple_get({ v: n }, {v: 1});
    
    milliseconds = current_time - startTime;
		
	return {
		milliseconds: milliseconds,
		output: output,
	};
}

global.simpleget_benchmark = {
	run: RunSimpleGetBenchmark,
	name: "simple-get",
}