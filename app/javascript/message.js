function revert (){
  const checkButton = document.querySelectorAll(".article-check-button")
  checkButton.forEach(function (button){
    button.addEventListener('click', function(){ 
      const deleteFlg = window.confirm('記事の既読を削除しますか？'); //ページ上部に確認タグが現れる
      if(deleteFlg) {
      const articleId = button.getAttribute("data");   //カスタムデータ属性として付与されている記事id情報を代入

      const XHR = new XMLHttpRequest();
    XHR.open("GET", "/checks/revert/${articleId}", true);  //通信自体を非同期通信にする！
    XHR.send();
    XHR.onload = () => {
      button.remove()
    }
  } else {
    ;
  }
    });
  });

 };

 
 window.addEventListener('turbo:load', revert);