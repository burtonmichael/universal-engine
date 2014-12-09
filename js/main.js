var engine = new Engine();

engine.init();

$('form .button').on('click', function(event) {
  event.preventDefault();
  if (validateSearchResultsForm(document.SearchResultsForm)) {
    document.SearchResultsForm.submit();
  }
});

$('.select-time').populateTime();
if (!engine.hasChosen) $('.select-wrap').selectFocus();
$('.check-image').checkImage();

$('#quantified-trusted').text(function () {
  return $(this).text().replace('{0}', '10');
});

$('.disabled').bind('click', disabledClick);

$('.return-check').change(function() {
  $('.tabs-wrap').removeClass('enabled');
  if ($(this).prop('checked')){
    $('.tab-drop').addClass('disabled');
    $('.tab-pick').click();
    $('.selected').removeClass('selected');
    $('.tab').unbind('click', tabClick).removeClass('tab-active');
    $('.disabled').bind('click', disabledClick);
  } else {
    $('.disabled').unbind('click', disabledClick);
    $('.tab').bind('click', tabClick).addClass('tab-active');
    $('.tabs-wrap').addClass('enabled');
    $('.tab-drop').removeClass('disabled').addClass('selected').click();
  }
});

$('.age-check').change(function() {
  if ($(this).prop('checked')){
    $('.input-age').fadeOut(250, function() {
      $('.age-label').fadeIn(250, function(){
        $('.input-age').val('25');
      });
    });
  } else {
    $('.age-label').fadeOut(250, function() {
      $('.input-age').val('').fadeIn(250);
    });
  }
});

$('.has-tip').on({
  mouseenter: function(e) {
    var $this = $(this),
      winWidth = $(window).width();
    if (winWidth >= 720 ) {
      $('.tip').text($this.data('tip')).css('display', 'block').position({
        my: engine.rtl ? 'left center' : 'right center',
        at: engine.rtl ? 'right center' : 'left center',
        of: $this,
        collision: 'flip',
        using: function (obj,info) {
          if (info.horizontal != "left") {
            $(this).removeClass("flipped").css({
            top: obj.top,
            left: obj.left - 6
            });
          } else {
            $(this).addClass("flipped").css({
            top: obj.top,
            left: obj.left + 6
            });
          }
        }
      });
    } else {
      $('.tip').text($this.data('tip')).css('display', 'block').position({
        my: engine.rtl ? 'right bottom-6' : 'left bottom-6',
        at: engine.rtl ? 'right+22 top' : 'left-22 top',
        of: $this,
        collision: 'fit'
      });
    }
  },

  mouseleave: function() {
    $('.tip').hide();
  }
});

frameReload();

function tabClick() {
  var $this = $(this),
    frame = $this.data('frame');
  $('.tab').removeClass('selected');
  $this.addClass('selected');
  $('.locations').hide(0);
  $('.' + frame).show(0);
}

function disabledClick() {
  var $label = $('.return-label'),
    revert;
  $label.addClass('notice');
  $('.return-check').click();
  clearTimeout(revert);
  revert = setTimeout(function(){
    $label.removeClass('notice');
  }, 1500);
}

function frameReload(){
  var spanVals = $('.locations .select-value'),
  selectVals = $('.locations select');
  selectVals.each(function(index){
    var $select = $(this),
    $selected = $select.find('option:selected'),
    $selectText = $selected.text(),
    $span = $(spanVals[index]);
    $span.removeClass('disabled');
    if($selectText !== $span.text()){
      $span.text($selectText);
      $select.trigger('chosen:updated');
    }
    if ($select.is(':disabled')){
      $span.addClass('disabled');
    } else if($selected.index() === 0){
      $select.trigger('chosen:updated');
    }
  });
}