$(document).ready(function() {
  // Lắng nghe sự kiện khi số lượng sản phẩm được thay đổi
  $('.quality-input').change(function() {
    var totalQuantity = 0;
    var totalPrice = 0;

    // Lặp qua mỗi sản phẩm trong giỏ hàng để tính tổng số lượng và tổng tiền
    $('.shoping__cart__item').each(function() {
      var price = parseInt($(this).find('.shoping__cart__price').attr('data-price'));
      var quantity = parseInt($(this).find('.quality-input').val());
      var subtotal = price * quantity;

      totalQuantity += quantity;
      totalPrice += subtotal;

      $(this).find('.shoping__cart__total').html(subtotal.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));
    });

    // Cập nhật tổng số lượng và tổng tiền trên trang
    $('#tongcong').html(totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));
    $('#tongtien').html(totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }));
  });
});