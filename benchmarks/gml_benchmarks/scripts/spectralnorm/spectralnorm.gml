

function RunSpectralNormBenchmark(scale_n) {

	function A(i,j) {
		return 1/((i+j)*(i+j+1)/2+i+1);
	}
	
	function Au(u,v) {
		var u_len = array_length(u);
		for (var i=0; i<u_len; ++i) {
			var t = 0;
			for (var j=0; j<u_len; ++j)
				t += A(i,j) * u[j];
			v[@i] = t;
		}
		return;
	}
  
	function Atu(u,v) {
		var u_len = array_length(u);
		for (var i=0; i<u_len; ++i) {
		    var t = 0;
		    for (var j=0; j<u_len; ++j)
				t += A(j,i) * u[j];
		    v[@i] = t;
		}
	}
  
	function AtAu(u,v,w) {
		Au(u,w);
		Atu(w,v);
	}
  
	function spectralnorm(n) {
		var i;
		var u=[];
		var v=[];
		var w=[];
		var vv=0;
		var vBv=0;
		for (i=0; i<n; ++i) {
		    u[@i] = 1;
			v[@i] = 0;
			w[@i] = 0; 
		}
		for (i=0; i<10; ++i) {
		    AtAu(u,v,w);
		    AtAu(v,u,w);
		}
		for (i=0; i<n; ++i) {
		    vBv += u[i]*v[i];
		    vv  += v[i]*v[i];
		}
		return sqrt(vBv/vv);
	}

	var milliseconds = 0;
		
    var output = spectralnorm(100);

    if(string_format(output, 1, 9) != "1.274219991") {
      throw "spectralnorm - test value was incorrect";	
    }
		
	var n = round(1250 * scale_n);
  
	var startTime = current_time;
  
	var output = spectralnorm(n);
  
	milliseconds = current_time - startTime;
		
	return {
		milliseconds: milliseconds,
		output: string_format(output, 1, 9),
	};
}

global.spectralnorm_benchmark = {
	run: RunSpectralNormBenchmark,
	name: "spectral-norm",
}

