// class = "ratings"の子要素を取得
const stars = document.querySelector(".ratings").children;
// id = "rating-value"の要素を取得
const ratingValue = document.getElementById("rating-value");
// id = "rating-value-display"の要素を取得
const ratingValueDisplay = document.getElementById("rating-value-display");
// indexという変数を定義
let index;

// reveiwの投稿ページに遷移するとstars.lengthの値（5）だけ繰り返し
for(let i=0; i<stars.length; i++){
	// 星にカーソルが乗ったときに実行する関数を定義
	stars[i].addEventListener("mouseover",function(){
		// stars.lengthの値（5）だけ繰り返し
		// つまり、星カーソルが乗った時、5回繰り返される
		for(let j=0; j<stars.length; j++){
			// まず全て星をくり抜く
			stars[j].classList.remove("fa-star");
			stars[j].classList.add("fa-star-o");
		}
		// そのあと星の数だけ以下の関数が繰り返される。
		for(let j=0; j<=i; j++){
			stars[j].classList.remove("fa-star-o");
			// カーソルが乗った星まで星を塗りつぶす
			stars[j].classList.add("fa-star");
		}
	})
}