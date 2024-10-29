console.log("review 모듈..");

let reviewService = function() {

	function reviewList(market_tour_code, callback) {

		$.ajax({

			type: "GET",
			url: "/board/review/" + market_tour_code,
			success: function(result) {
				console.log(result);
				if (callback) {
					callback(result);
				}
			},
			error: function(e) {
				console.log(e);
			}

		});

	}

	function write(review) {

		$.ajax({

			type: "POST",
			url: "/board/review/create",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(review),
			success: function(result) {

				if (result == "SUCCESS")
					console.log(result);
				location.reload();

			},
			error: function(e) {
				console.log(e);
			}

		});

	}

	function del(review_id) {

		$.ajax({

			type: "DELETE",
			url: "/board/review/delete/" + review_id,
			success: function(result) {

				console.log("삭제된 개수 : " + result);
				location.reload();

			},
			error: function(e) {
				console.log(e);
			}

		});

	}


	return {
		reviewList: reviewList,
		write: write,
		del: del,
	}

}