
function RunSimplePrimesBenchmark(scale_n) {

    function count_primes_up_to(n) {
        var primes = 0;
        for(var i=0; i<=n; i++) {
            if(is_prime(i)) primes ++;
        }
        return primes;
    }

    function is_prime(n) {
        if (n <= 3) {
            return n > 1;
        }
        if ((n % 2 == 0) || (n % 3 == 0)) {
            return false;
        }
        var i = 5;
        while (i * i <= n) {
            if (n % i == 0 || n % (i + 2) == 0) {
                return false;
            }
            i += 6;
        }
        return true;
    }

	
	var milliseconds = 0;

    var output = count_primes_up_to(1000);

    if(output != 168) {
        throw "final value was incorrect";	
    }
    
	var n = round(1000000 * scale_n);
	
    var startTime = current_time;
    
    var output = count_primes_up_to(n);
    
    milliseconds = current_time - startTime;
		
	return {
		milliseconds: milliseconds,
		output: output,
	};
}

global.simpleprimes_benchmark = {
	run: RunSimplePrimesBenchmark,
	name: "simple-primes",
}