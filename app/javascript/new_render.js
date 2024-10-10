let formElement = document.getElementById('charge-form');
let itemId = formElement.dataset.itemId; // ここを動的に取得する部分に置き換える

history.replaceState({}, '', `/items/${itemId}/orders/new`);