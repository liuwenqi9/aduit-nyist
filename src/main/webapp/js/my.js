$(function () {
    var MaxInputs = 2
    var InputWrapper = $("#message");
    var Addbutton = $("#btn_add");
    var x = InputWrapper.length;
    var FieldCound = 1;
    var FieldCount = 1;
    $(Addbutton).click(function (e) {
        if(x<=MaxInputs){
            FieldCound++;
            $(InputWrapper).append('<div class="form-inline" id="field_'+FieldCound+'">\n' +
                '                                <div class="form-group list-top">\n' +
                '                                    <label>教研室名称</label>\n' +
                '                                    <input type="text" name="documents['+FieldCount+'].roomname" class="form-control" placeholder="教研室名称'+FieldCound+'">\n' +
                '                                </div>\n' +
                '                                <div class="form-group list-top">\n' +
                '                                    <label>自评分数</label>\n' +
                '                                    <input type="number" name="documents['+FieldCount+'].selfscore" class="form-control" placeholder="自评分数">\n' +
                '                                </div>\n' +
                '                                <div class="form-group list-top">\n' +
                '                                    <input type="file" name="file" accept="application/msword,application/pdf,">\n' +
                '                                </div>\n' +
                '                                <div class="form-group list-top">\n' +
                '                                    <button type="button" class="close removeclass"><span>&times;</span></button>\n' +
                '                                </div>\n' +
                '                            </div>')
            x++;
            FieldCount++;
        }
        if(x>MaxInputs){
            zlalert.alertInfoToast('单次上传教研室数量达到上限')
        }
    })
    $("body").on("click",".removeclass", function(e){ //user click on remove text
        if( x > 1 ) {
            $(this).parent('div').parent('div').remove(); //remove text box
            x--; //decrement textbox
        }
        return false;
    })


});