$(document).ready(function () {
	
	setElements();
    setEvents();
    enableClickRow();
});

/* Used to change submit button behaviour*/
function setElements() {
    $("#search").attr("type", "button");
    $("#clearCriteria").attr("type", "button");
    resultsTable = $("#refundTable").dataTable({
        "bFilter": false, "bProcessing": true, "sPaginationType": "full_numbers", "bDestroy": true, "aoColumns": [
            {"mData": "caseNumber", "sWidth": "10%"}
            ,{"mData": "dateCreated", "sWidth": "10%"}
            ,{"mData": "agent", "sWidth": "20%"}
            ,{"mData": "customerName", "sWidth": "20%"}
            ,{"mData": "cardNumber", "sWidth": "10%"}
            ,{"mData": "paymentMethod", "sWidth": "10%"}
            ,{"mData": "status", "sWidth": "20%"}
        ],
        "fnDrawCallback": function(oSettings) {
        	enableClickRow();
            if (oSettings._iDisplayLength > oSettings.fnRecordsDisplay()) {
                $(oSettings.nTableWrapper).find('.dataTables_paginate').hide();
            } else {
                $(oSettings.nTableWrapper).find('.dataTables_paginate').show();
            }
        },
    	"iDisplayLength": 50,
    	"aLengthMenu": [50, 100, 150, 200],
    	"aaSorting": [[ 0, 'asc' ]]
    });
}

function setEvents() {
    $("#search-button").click(function () {
        search();
    });
    $("form").submit(function () {
        search();
        return false;
    });
    $("#clearCriteria-button").click(function () {
        clearCriteria();
    });
    
    $("input[type=text]").each(function () {
        $(this).bind('keypress', function (e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) {
                search();
            }
        });
    });
    
    function search() {
        if (checkEmptySearch()) {
            alert('Please add a search criteria');
            $("input[type='text']").first().focus();
        } else {
        	toggleLoading(-1);
            $.post(sAddress + '/' + pageName + '/refundValid.htm', $("form").serialize(), function (response) {
                if (response != '{}') {
                    var message = "";
                    var obj = $.parseJSON(response);
                    $.each(obj, function (i, n) {
                        message = message + n + '\n';
                    });
                    alert(message);
                    toggleLoading(-2);
                } else {
                    $.post(sAddress+'/' + refundSearchURL, $("form").serialize(), function (response) {
                        setNewResult(($.parseJSON(response)));
                    });
                }
            });
        }
    }

    function checkEmptySearch() {
        var empty = true;
        $("input").each(function () {
        	if (this.type != 'checkbox' && this.type!= 'hidden') {
        		if (this.value != '') empty = false;
        	}
        });
        return empty;
    }
    
    function clearCriteria() {
        $("#loading-box").hide();
        $("#refundTable").show();
        $("input[type=text]").each(function () {
        	$(this).val("");
        });
        $("input[type=checkbox]").each(function () {
        	$(this).attr('checked', false);
        });
        
        getAll();
        
        toggleLoading(-2);
    }
}

function getAll() {
	$.post(sAddress + '/' + pageName + '/getAll.htm', function (response) {
        setNewResult(($.parseJSON(response)));
    });
}

function setNewResult(dataArray) {
	resultsTable.fnClearTable(this);
	if (dataArray === null || dataArray.length == 0){
		   $("#messageArea").html("No results found");
	} else {
		$("#messageArea").html("");
        resultsTable.fnAddData(dataArray);
        enableClickRow();
	}
	toggleLoading(dataArray.length);
}

function enableClickRow(){
	$("#refundTable tr").unbind("click");
	$("#refundTable tr").on("click", function (event) {
        var iPos = resultsTable.fnGetPosition(this);
        var aData = resultsTable.fnGetData(iPos);
          openLink( sAddress + '/' + refundCaseURL + '?caseNumber=' + aData.caseNumber);
    });
}