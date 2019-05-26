// Code your JavaScript / jQuery solution here
let gameId;
let selectedCase;
let entrySelector;

$(document).ready(function() {
    gameId = $('table.outer').data("id");
    attachListeners();
});

function setMessage(value) {
    $('div#message').append(value);
}

function reset() {
    gameId = null;
    $('td').empty();
    $('#games').empty();
    $('#message').empty();
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
        id: $(selectedCase).data("id"),
        line: $(selectedCase).data("x"),
        column: $(selectedCase).data("y"),
        bloc: $(selectedCase).data("bloc")
    };

    if ($(this).attr("class") == "blank") {
        data.value = "";
    } else {
        data.value = $(this).text();
    }

    $(selectedCase).text(data.value);

    var posting = $.ajax({
        type: 'PATCH',
        url: `/boxes/${data.id}`,
        data: data
    });
    posting.done(function(game) {
        // TODO: handle response
        // $("p").toggleClass("main");
        if (game.errors) {
            Object.keys(game.errors).forEach((key) => errorsEffect(key, data));
            console.log("error");

            $(selectedCase).toggleClass('error');
        } else {
            sanitize();
        }
    });
    posting.fail(function(game) {
        // TODO: handle response
        // setMessage(game.responseText);
        console.log("fail");
        console.log(game.responseText);
    });
    console.log("this2 :");
    console.log(this);
    $(selectedCase).popover('hide');
    // selectedCase = null;
}

function selectCase(event) {
    event.preventDefault();
    $(selectedCase).popover('hide');
    selectedCase = this;
    console.log("this1 :");
    console.log(this);
    // entrySelector = `#${$(selectedCase).attr("aria-describedby")} div.entry`;
    $('.popover').on('click', '.popover-body a', updateState);
}

function clearGame(event) {
    reset();
}

function cleanBackwardAction() {}

function errorsEffect(errorKey, data) {
    let elem;
    switch (errorKey) {
        case "line":
            elem = `.inner [data-x=${data.line}]`;
            break;
        case "column":
            elem = `.inner [data-y=${data.column}]`;
            break;
        case "bloc":
            elem = `[data-mbloc=${data.bloc}]`;
            break;
        default:
            break;
    }

    $(elem).toggleClass(`error-${errorKey}`);
    // setTimeout(() => $(elem).toggleClass(`error-${errorKey}`), 10000);
    console.log("Elem : " + elem);
}

function sanitize() {
    $('.error').toggleClass('error');
    $('.error-line').toggleClass('error-line');
    $('.error-column').toggleClass('error-column');
    $('.error-bloc').toggleClass('error-bloc');
}