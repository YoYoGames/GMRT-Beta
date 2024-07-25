function RunNBodyBenchmark(scale_n) {
	
	var milliseconds = 0;
	
	var energy = RunNBodySimulation(0);
	if(string_format(energy,1,9) != "-0.169075164") {
		throw "nbody - initial energy value was incorrect";
	}
	energy = RunNBodySimulation(1000);
	if(string_format(energy,1,9) != "-0.169087605") {
		throw "nbody - test energy value was incorrect";
	}
	
	var iterations = round(1000000 * scale_n);
	
	var startTime = current_time;
	
	energy = RunNBodySimulation(iterations);
	
	milliseconds = round(current_time - startTime);
	
	return {
		milliseconds: milliseconds,
		output: string_format(energy,1,9),
	};
}

function RunNBodySimulation(iterations) {
	
	#macro SOLAR_MASS (4 * pi * pi)
	#macro DAYS_PER_YEAR 365.24

	function Jupiter() {
		return {
			x: 4.841431442464721,
			y: -1.1603200440274284,
			z: -0.10362204447112311,
			vx: 0.001660076642744037 * DAYS_PER_YEAR,
			vy: 0.007699011184197404 * DAYS_PER_YEAR,
			vz: -0.0000690460016972063 * DAYS_PER_YEAR,
			mass: 0.0009547919384243266 * SOLAR_MASS,
		}
	}

	function Saturn() {
		return {
			x: 8.34336671824458,
			y: 4.124798564124305,
			z: -0.4035234171143214,
			vx: -0.002767425107268624 * DAYS_PER_YEAR,
			vy: 0.004998528012349172 * DAYS_PER_YEAR,
			vz: 0.000023041729757376393 * DAYS_PER_YEAR,
			mass: 0.0002858859806661308 * SOLAR_MASS,	
		}
	}

	function Uranus() {
		return {
			x: 12.894369562139131,
			y: -15.111151401698631,
			z: -0.22330757889265573,
			vx: 0.002964601375647616 * DAYS_PER_YEAR,
			vy: 0.0023784717395948095 * DAYS_PER_YEAR,
			vz: -0.000029658956854023756 * DAYS_PER_YEAR,
			mass: 0.00004366244043351563 * SOLAR_MASS,
		}
	}

	function Neptune() {
	    return {
			x: 15.379697114850917,
			y: -25.919314609987964,
			z: 0.17925877295037118,
			vx: 0.0026806777249038932 * DAYS_PER_YEAR,
			vy: 0.001628241700382423 * DAYS_PER_YEAR,
			vz: -0.00009515922545197159 * DAYS_PER_YEAR,
			mass: 0.000051513890204661145 * SOLAR_MASS,
		}
	}

	function Sun() {
		return {
			x: 0.0,
			y: 0.0,
			z: 0.0,
			vx: 0.0,
			vy: 0.0,
			vz: 0.0,
			mass: SOLAR_MASS,
		}
	}

	function offsetMomentum(bodies) {
	    var px = 0;
	    var py = 0;
	    var pz = 0;
	    var size = array_length(bodies);
	    for (var i = 0; i < size; i++) {
	        var body = bodies[i];
	        var mass = body.mass;
	        px += body.vx * mass;
	        py += body.vy * mass;
	        pz += body.vz * mass;
	    }

	    var body = bodies[0];
	    body.vx = -px / SOLAR_MASS;
	    body.vy = -py / SOLAR_MASS;
	    body.vz = -pz / SOLAR_MASS;
	}

	function advance(bodies, dt) {
	    var size = array_length(bodies);

	    for (var i = 0; i < size; i++) {
	        var bodyi = bodies[i];
	        var vxi = bodyi.vx;
	        var vyi = bodyi.vy;
	        var vzi = bodyi.vz;
	        for (var j = i + 1; j < size; j++) {
	            var bodyj = bodies[j];
	            var dx = bodyi.x - bodyj.x;
	            var dy = bodyi.y - bodyj.y;
	            var dz = bodyi.z - bodyj.z;

	            var d2 = dx * dx + dy * dy + dz * dz;
	            var mag = dt / (d2 * sqrt(d2));

	            var massj = bodyj.mass;
	            vxi -= dx * massj * mag;
	            vyi -= dy * massj * mag;
	            vzi -= dz * massj * mag;

	            var massi = bodyi.mass;
	            bodyj.vx += dx * massi * mag;
	            bodyj.vy += dy * massi * mag;
	            bodyj.vz += dz * massi * mag;
	        }
	        bodyi.vx = vxi;
	        bodyi.vy = vyi;
	        bodyi.vz = vzi;
	    }

	    for (var i = 0; i < size; i++) {
	        var body = bodies[i];
	        body.x += dt * body.vx;
	        body.y += dt * body.vy;
	        body.z += dt * body.vz;
	    }
	}

	function energy(bodies) {
	    var e = 0;
	    var size = array_length(bodies);

	    for (var i = 0; i < size; i++) {
	        var bodyi = bodies[i];

	        e += 0.5 * bodyi.mass * ( bodyi.vx * bodyi.vx + 
	            bodyi.vy * bodyi.vy + bodyi.vz * bodyi.vz );

	        for (var j = i + 1; j < size; j++) {
	            var bodyj = bodies[j];
	            var dx = bodyi.x - bodyj.x;
	            var dy = bodyi.y - bodyj.y;
	            var dz = bodyi.z - bodyj.z;

	            var distance = sqrt(dx * dx + dy * dy + dz * dz);
	            e -= (bodyi.mass * bodyj.mass) / distance;
	        }
	    }
	    return e;
	}
	
	var bodies = [Sun(), Jupiter(), Saturn(), Uranus(), Neptune()];

	offsetMomentum(bodies);

	for (var i = 0; i < iterations; i++) {
	    advance(bodies, 0.01);
	}

	return energy(bodies);
}


global.nbody_benchmark = {
	run: RunNBodyBenchmark,
	name: "n-body",
}