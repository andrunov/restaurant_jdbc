/**
 * Class serves restaurants.jsp
 * works with restaurants
 */

/*url for exchange JSON data between DataTable and server*/
var ajaxUrl = '/ajax/restaurants/';

/*url for link to menuLists.jsp*/
var goMenuLists = '/menuLists/';

/*variable links to DataTable represents restaurants in restaurants.jsp*/
var datatableApi;

/*variable links to restaurants.edit resource bundle */
var editTitleKey ="restaurants.edit";

/*variable links to restaurants.add resource bundle */
var addTitleKey ="restaurants.add";

/*function to update DataTable by data from server*/
function updateTable() {
    $.get(ajaxUrl, updateTableByData);
}

/*document.ready function*/
$(function () {
    datatableApi = $('#datatable').DataTable({
        "ajax": {
            "url": ajaxUrl,
            "dataSrc": ""
        },
        "paging": false,
        "searching": true,
        "info": true,
        "columns": [
            {
                "data": "name"
            },
            {
                "data": "address"
            },
            {
                "orderable": false,
                "defaultContent": "",
                "className": "dt-center",
                "render": executionsBtns
            }
        ],
        "order": [
            [
                0,
                "asc"
            ]
        ],
        "createdRow": "",
        "initComplete": makeEditable
    });
});

/*function for draw manage buttons*/
function executionsBtns(data, type, row) {
    if (type == 'display') {
        if (row.hasOrders) {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goMenuLists + row.id + '">' + i18n["menuLists.title"] + '</a>' +
                    '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.update"] + '</a>';
        }else {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goMenuLists + row.id + '">' + i18n["menuLists.title"] + '</a>' +
                    '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.update"] + '</a>' +
                    '<a class="btn btn-danger" onclick="deleteRow(' + row.id + ');">' + i18n["common.delete"] + '</a></div>';
        }
    }
}



