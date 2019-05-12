// Code your JavaScript / jQuery solution here
'use strict';
let gameId;
let selectedCase;
let entrySelector;

$(document).ready(function() {
    gameId = $('table.outer').data("id");
    attachListeners();
});

function setMessage(value) {
    $('div#message').text(value);
}

function reset() {
    gameId = null;
    $('td').empty();
    $('#games').empty();
    $('#message').empty();
    // console.log(turn);
}

function attachListeners() {
    // $("#save").on('click', saveGame);
    // $("#clear").on('click', clearGame);
    // $("#previous").on('click', gameHistory);
    $(document.body).on('click', 'table.inner td', (e) => {
        e.stopPropagation();
        e.preventDefault();
        $(e.target).popover('show');
    });
    $("table.inner td").on('shown.bs.popover', selectCase);
    $(function() {
        $('[data-toggle="popover"]').popover({
            container: 'body',
            content: $('#entries').html(),
            trigger: 'manual',
            html: true
        });
    });
}

function updateState(event) {
    let data = {
        // id: $(selectedCase).data("id"),
        line: $(selectedCase).data("x"),
        column: $(selectedCase).data("y")
    };

    if ($(this).attr("class") == "blank") {
        data.value = "";
    } else {
        data.value = $(this).text();
    }

    $(selectedCase).text(data.value);

    // var posting = $.ajax({
    //     type: 'PATCH',
    //     url: `/boxes/${$(selectedCase).data("id")}`,
    //     data: data
    // });
    // posting.done(function(game) {
    //     // TODO: handle response
    //     gameId = game.data.id;
    // });
    // posting.fail(function(game) {
    //     // TODO: handle response
    //     gameId = game.data.id;
    // });
    console.log("this2 :");
    console.log(this);
    $('.popover-body a').off('click');
    $(selectedCase).popover('hide');
    selectCase = null;
}

function selectCase(event) {
    event.preventDefault();
    $(selectedCase).popover('hide');
    selectedCase = this;
    console.log("this1 :");
    console.log(this);
    // entrySelector = `#${$(selectedCase).attr("aria-describedby")} div.entry`;
    $(document.body).on('click', '.popover-body a', updateState);
}

function clearGame(event) {
    reset();
}

function cleanBackwardAction() {}