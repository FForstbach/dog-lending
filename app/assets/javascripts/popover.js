
        $(document).ready(function() {
            $("input[name='availability']").click(function(){
              var availability_path = $(this).closest("form").attr("action");

              var data = {
                value: $(this).val(),
                status: $(this).is(":checked")
              };




                // var favorite = [];
                // $.each($("input[name='availability']:checked"), function(){
                //     favorite.push($(this).val());
                // });
                console.log("My dog is available: ", data);
            $.post(availability_path, data);




            });
        });
