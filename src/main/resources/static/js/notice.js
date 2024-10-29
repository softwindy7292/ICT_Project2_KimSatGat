console.log("notice 모듈..");

let noticeService = function() {

	function noticeList(callback) {

		$.ajax({

			type: "GET",
			url: "/board/notice",
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

	function getNotice(notice_id, callback) {

		$.ajax({

			type: "GET",
			url: "/board/notice/" + notice_id,
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

	function write(notice) {

		$.ajax({

			type: "POST",
			url: "/board/notice/create",
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(notice),
			success: function(result) {

				if (result == "SUCCESS")
					console.log(result);
					window.location.href = 'noticeBoardList.html'

			},
			error: function(e) {
				console.log(e);
			}

		});

	}

	function update(notice, callback) {
	    $.ajax({
	        type: "PUT",
	        url: "/board/notice/update",
	        contentType: 'application/json; charset=utf-8',
	        data: JSON.stringify(notice),
	        success: function(result) {
	            console.log("서버 응답:", result); // 응답 확인
	            callback(result === "SUCCESS" ? "SUCCESS" : "FAILURE"); // 결과에 따라 콜백 호출
	        },
	        error: function(e) {
	            console.log("AJAX 호출 오류:", e); // 오류 로그 확인
	            callback("ERROR");
	        }
	    });
	}

	function del(notice_id) {

		$.ajax({

			type: "DELETE",
			url: "/board/notice/delete/" + notice_id,
			success: function(result) {

				console.log("삭제된 개수 : " + result);

			},
			error: function(e) {
				console.log(e);
			}

		});

	}


	return {
		noticeList: noticeList,
		getNotice: getNotice,
		write: write,
		update: update,
		del: del,
	}

}