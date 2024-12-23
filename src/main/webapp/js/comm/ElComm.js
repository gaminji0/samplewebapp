
/**
 * グローバル変数の宣言
 * @date 2019.09.29
 * @memberOf
 * @param 
 * @returns
 * @author 
 * @example
 */
var CONTEXT_PATH = "/ElService/";

/**
 * クッキーを保存する
 * @date 2019.09.29
 * @memberOf
 * @param 
 * @returns
 * @author 
 * @example
 */	
function setCookie(key, value, date) {
	
	var expire = new Date();
       expire.setDate(expire.getDate() + date);
       cookies = key + '=' + escape(value) + '; path=/';
       if(typeof date != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
       document.cookie = cookies;
       
}

/**
 * クッキーを取得する
 * @date 2019.09.29
 * @memberOf
 * @param 
 * @returns
 * @author 
 * @example
 */	
function getCookie(key) {
	key = key + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(key);
    var value = '';
    if(start != -1){
        start += key.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1) end = cookieData.length;
        value = cookieData.substring(start, end);
    }
    return unescape(value);
}

/**
 * リクエスト情報を受け取ってAjaxを実行する
 * @date 2019.09.29
 * @memberOf
 * @param
 * @returns
 * @author 
 * @example
 */
function executeAjax(url, object, callback) {
	
	$.ajax({
		url 	    : url,
		type        : "post",
		dataType    : "json",
		data        : object,
		contentType : "application/json; charset=utf-8",
		headers : {
			"Proworks-Body":"Y",  // HTTPボディにJSONオブジェクトを渡すためのフラグ
			"Proworks-Lang":"ko"  // 多言語対応のための言語設定 (未設定の場合はkoが設定される)
		},	
	})
	.done(function(data) {
		callback(data);
	})
	.fail(function(request, status, error) {
		var data = {"code":request.status, "message":request.responseText, "error":error};
		alert("[ HTTPステータス ] " + data.code + " エラーが発生しました。");
	})
	.always(function() {
		
	});
	
}

/**
 * elHeader処理の例外発生時にアラートを表示する
 * @date 2019.09.29
 * @memberOf
 * @param
 * @returns
 * @author 
 * @example
 */
function exceptionAlert(funcName, resCode, resMsg) {
	alert(funcName + " 処理中に例外が発生しました。" + "\n" + "- CODE: " + resCode + "\n" + "- MESSAGE : " + resMsg);
}

/**
 * 指定のページに移動する
 * @date 2019.09.29
 * @memberOf
 * @param
 * @returns
 * @author 
 * @example
 */
function moveLocation(url) {
	$(location).attr("href", CONTEXT_PATH + url);
}
