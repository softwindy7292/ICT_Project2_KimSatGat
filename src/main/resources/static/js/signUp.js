console.log("signUp 모듈..");

let signUpService = function() {

	function join(member) {

		$.ajax({

			type: "POST",
			url: "/signUp/join",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(member),
			success: function(result) {
				
				console.log(member)
				
				if (result == "SUCCESS")
					console.log(result);

			},
			error: function(e) {
				console.log(e);
			}

		});

	}


	return {
		join: join,
	}

}