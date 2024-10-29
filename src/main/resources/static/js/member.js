console.log("member 모듈..");

let memberService = function() {

	function memberList(callback) {

		$.ajax({

			type: "GET",
			url: "/members/list",
			success: function(result) {
				console.log(result);
				if(callback){
					callback(result);
				}
			},
			error: function(e) {
				console.log(e);
			}

		});

	}
	
	function getMember(id, callback) {

			$.ajax({

				type: "GET",
				url: "/members/" + id,
				success: function(result) {
					console.log(result);
					if(callback){
						callback(result);
					}
				},
				error: function(e) {
					console.log(e);
				}

			});

		}

	function del(id) {

		$.ajax({

			type: "DELETE",
			url: "/members/delete/" + id,
			success: function(result) {

				console.log("삭제된 개수 : " + result);

			},
			error: function(e) {
				console.log(e);
			}

		});

	}
	

	return {
		memberList : memberList,
		getMember : getMember,
		del	: del,
	}

}