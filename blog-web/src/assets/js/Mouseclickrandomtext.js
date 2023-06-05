export function text () {
    var fontAll = [
        '辛德拉',
        '劫',
        '卡萨丁',
        '崔斯特',
        '格雷福斯',
        '安妮',
        '阿木木',
        '卡兹克',
        '纳尔',
        '德莱厄斯',
        '德莱文',
        '卡尔玛',
    ];
    var colorAll = [
        'red',
        'pink',
        'yellow',
        'blue',
        'aqua',
        'green',
        'gold',
        'brown',
        'grey',
        'orange',
    ];
    $(document).click(function (e) {
        var $span1 = $('<span>' + fontAll[Math.floor(Math.random() * fontAll.length)] + '</span>');
        $('body').append($span);
        $span1.css('color', colorAll[Math.floor(Math.random() * colorAll.length)])
        var width = $span1.width()
        var height = $span1.height()
        var init = e.pageY - height / 2;
        $span1.css({
            left: e.pageX - width / 2 + 'px',
            top: init + 'px'
        });
        $span1.animate({
            fontsize: 10 + 'px',
            top: init - 150 + 'px',
            opacity: .2
        }, 1000, function () {
            $span1.css('display', 'none');
        })
    });
};