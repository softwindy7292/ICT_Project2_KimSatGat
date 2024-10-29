console.log("myPage 모듈..");

let myPageService = function() {

	function myPageList(callback) {

		$.ajax({

			type: "GET",
			url: "/mypage",
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

	function updateMember(member) {

		$.ajax({

			type: "PUT",
			url: "/mypage/update",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(member),
			success: function(result) {

				if (result == "SUCCESS")
					console.log(result);

			},
			error: function(e) {
				console.log(e);
			}

		});

	}

	function getReview(review_id, callback) {

			$.ajax({

				type: "GET",
				url: "/board/review/myPage/" + review_id,
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

	function updateReview(review) {

		$.ajax({

			type: "PUT",
			url: "/board/review/update",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(review),
			success: function(result) {

				console.log(result);
				window.location.href = "/myInfo.html";

			},
			error: function(e) {
				console.log(e);
			}

		});

	}

	return {
		myPageList: myPageList,
		updateMember: updateMember,
		getReview: getReview,
		updateReview: updateReview,
	}

}