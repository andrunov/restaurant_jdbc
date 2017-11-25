/**
 * Class serves menuList.jsp
 * works with menuLists of specific restaurant
 */

/*url for exchange JSON data between DataTable and server*/
var ajaxUrl = '/ajax/menuLists/';

/*url for exchange JSON data between main form DataTable
 *represents menu lists, and server, using filter by status*/
var ajaxUrlWithFilter = '/ajax/menuLists/filterByEnabled/';

/*url for link to order_by_dish.jsp*/
var goDishes = '/dishes/';

/*variable links to DataTable represents menu lists in menuList.jsp*/
var datatableApi;

/*variable links to menuLists.edit resource bundle */
var editTitleKey ="menuLists.edit";

/*variable links to menuLists.add resource bundle */
var addTitleKey ="menuLists.add";

/*variable for save current filter value*/
var currentFilterValue = "ALL";

/*function to update DataTable by data from server*/
function updateTable(enabledKey) {
    if (enabledKey == "ALL") {
        $.get(ajaxUrl, updateTableByData);
    }
    else {
        $.get(ajaxUrlWithFilter+enabledKey, updateTableByData);
    }
    currentFilterValue = enabledKey;
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
            /*add column with image depending of Enabled*/
            {
                "orderable": false,
                "data": "enabled",
                "render": function (data, type, row) {
                    if (type == 'display') {
                        if (data){
                            return '<img  src="resources/pictures/menulist.png" />';
                        }
                        else {
                            return '<img  src="resources/pictures/cross.png" />';
                        }
                    }
                    return null;
                }
            },
            {
                "data": "description"
            },
            {
                "data": "dateTime",
                "render": function (date, type, row) {
                    if (type == 'display') {
                        return formatDate(date);
                    }
                    return date;
                }
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
        /*customize row style depending of Enabled*/
        "createdRow": function (row, data, dataIndex) {
            if (!data.enabled) {
                $(row).addClass("disabled");
            }
        },
        "initComplete": makeEditable
    });

    $.datetimepicker.setLocale(localeCode);

    /*set field with datetimepicker*/
    $('#dateTime').datetimepicker({
        format: 'Y-m-d H:i'
    });
});

/*function for draw manage buttons*/
function executionsBtns(data, type, row) {
    if (type == 'display') {
        if (row.hasOrders) {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goDishes + row.id + '">' + i18n["menuLists.content"] + '</a>' +
                '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.status"] + '</a>';
        }else {
            return '<div class="btn-group pull-left"><a class="btn btn-primary" onclick=location.href="' + goDishes + row.id + '">' + i18n["menuLists.content"] + '</a>' +
                '<a class="btn btn-success" onclick="updateRow(' + row.id + ');">' + i18n["common.status"] + '</a>' +
                '<a class="btn btn-danger" onclick="deleteRowWithFilter(' + row.id + ');">' + i18n["common.delete"] + '</a></div>';
        }
    }
}

/*method to update row in tables */
function updateRow(id) {
    $('#modalTitle').html(i18n[editTitleKey]);
    $.get(ajaxUrl + id, function (data) {
        $.each(data, function (key, value) {
            if (key === "enabled") {
                $("#" + key).prop("checked", value);
            }
            else {
                form.find("input[name='" + key + "']").val(value);
            }
        });
        $('#editRow').modal();
    });
}