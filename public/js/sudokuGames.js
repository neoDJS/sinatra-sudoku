// $(document).ready(function() {
//     attachListeners();
// });

// function attachListeners() {
//     $("table.outer").on('click', openGame);
//     // $("#clear").on('click', clearGame);
//     // $("#previous").on('click', previousGames);
//     // $("td").on('click', function() {
//     //     if ((!checkWinner()) && (turn <= 9)) {
//     //         doTurn(this);
//     //     }
//     // });
// }

// function openGame(event) {
//     //prevent form from submitting the default way
//     event.preventDefault();

//     // reset();
//     const id = $(this).data("id");
//     $.getJSON(`/games/${id}`, res => {
//         let ci;
//         res["data"]["attributes"]["state"].forEach((val, i) => {
//             $($('td')[i]).text(val);
//             if (val != '') { ci = i; }
//         });
//         turn = res["data"]["attributes"]["state"].join('').length;
//         gameId = res["data"]["id"];
//         if (ci) {
//             doTurn($('td')[ci]);
//         }
//     }).fail(function(error) {
//         console.log('Chargement du jeu non reussi: ' + error.statusText);
//     });
// }