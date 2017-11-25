/**
 * Class serves dishes.jsp
 * works with dishes of specific menuList
 */

/*url for exchange JSON data between DataTable and server*/
var ajaxUrl = '/ajax/dishes/';

/*url for link to order_by_dish.jsp*/
var goOrdersByDish = '/orders_by_dish/';

/*variable links to DataTable represents dishes in dishes.jsp*/
var datatableApi;

/*variable links to dishes.edit resource bundle */
var editTitleKey ="dishes.edit";

/*variable links to dishes.add resource bundle */
var addTitleKey ="dishes.add";

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
        "searching": false,
        "info": true,
        "columns": [
            {
                "data": "description"
            },
            {
                "data": "price"
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
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goOrdersByDish + row.id + '">' + i18n["orders.title"] + '</a>' +
                '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.update"] + '</a>';
        }else {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" disabled="true">' + i18n["orders.title"] + '</a>' +
                '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.update"] + '</a>' +
                '<a class="btn btn-danger" onclick="deleteRow(' + row.id + ');">' + i18n["common.delete"] + '</a></div>';

        }
    }
}

