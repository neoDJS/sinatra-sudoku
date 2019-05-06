// Code your JavaScript / jQuery solution here
let gameId;
let selectedCase;

$(document).ready(function() {
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
    $("table.inner td").on('click', selectCase);
    $("div.entry div.col").on('click', updateState);
    $('[data-toggle="popover"]').popover({
        container: 'body',
        content: $('.entry').html(),
        trigger: 'focus',
        html: true
    });
}

function updateState(event) {
    // var x = parseInt($(el).data("x"));
    // var y = parseInt($(el).data("y"));
    // event.preventDefault();
    $(selectedCase).text($(this).text());
    // $(this).popover('hide');
}

function selectCase(event) {
    selectedCase = this; // $(event.relatedTarget); //
}

function clearGame(event) {
    reset();
}