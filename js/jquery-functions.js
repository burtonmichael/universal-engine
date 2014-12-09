$.fn.selectFocus = function() {
  return this.each(function() {
    var a = $(this);
    a.find('select')
    .focus(function() {
      a.addClass('focus');
    })
    .blur(function() {
      a.removeClass('focus');
    });
    if (!a.find('.select-value').text()) {
      a.find('.select-value').text($(this).find('option:selected').text());
    }
  });
};


$.fn.populateTime = function() {
  return this.each(function() {
    var a = $(this),
      b = a.nextAll('.hidden-input');
    for (var i = 0; i < 24; i++) {
      var hour = (i < 10) ? '0' + (i + '') : (i + '');
      for (var j = 0; j < 4; j++) {
        var minute = (j === 0) ? '00' : (j * 15 + ''),
          value = i + ':' + (j * 15),
          text = hour + ':' + minute,
          obj = {
            value: value,
            text: text
          };
        if (text == '11:30') {
          obj['selected'] = 'selected';
        }
        a.append($('<option>', obj));
      }
    }
    a.on('change', function(evt) {
      var vals = evt.target.value || a.find('option:selected').val();
      a.prev('.select-value').text(a.children(':selected').text());
      vals = vals.split(':');
      b.eq(0).val(vals[0]);
      b.eq(1).val(vals[1]);
    });
  });
};

$.fn.checkImage = function() {
  return this.each(function() {
    var $this = $(this),
        $input = $this.next('input');
    $this.on('click', function() {
      $input.click();
    });
    $input.on('change', function() {
      $this.toggleClass('check-image-unchecked');
    });
  });
}