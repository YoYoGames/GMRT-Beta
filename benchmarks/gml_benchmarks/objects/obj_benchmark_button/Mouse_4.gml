
if(!completed){	
	var result = benchmark.run();
	result_text = "";
	if(result.error == "") {
		result_text += "Success!\n";
	}
	else {
		result_text += "Error: " + result.error + "\n";
	}
	result_text += "Executed in " + string(result.milliseconds) + "ms\n";
	result_text += "Produced output: " + string(result.output) + "\n";
}
