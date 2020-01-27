// $(function(){
//   function buildHTML(wish){
//     var html = `<tr>
//                   <td class="body-month">${wish.month}</td>
//                   <td class="body-text">${wish.content}</td>
//                   <td class="body-cost">${wish.cost}</td>`
//                   // <td><a class="edit-btn" href="wishes_path(id: wish.id)">変更</a></td>
//                   // <td><a class="delete-btn" rel="nofollow" data-method="delete" href="wish">削除</a></td>
//                 // </tr>`
//     return html;
//   };
//   $('#new_wish').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,  
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(wish){
//       var html = buildHTML(wish);
      
//       $('tbody').append(html);
      
//       $('form')[0].reset();
//       $('.submit-btn').prop('disabled', false);
//     })
//     .fail(function() {
//       alert("メッセージ送信に失敗しました");
//     });
//   });

// });