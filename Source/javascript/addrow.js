$(document).ready(function() {

            option_list('addr0');

            var i = 1;
            $("#add_row").click(function() {
                b = i - 1;
                $('#addr' + i).html($('#addr' + b).html()).find('td:first-child').html(i + 1);
                $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
                option_list('addr' + i);
                i++;
            });
            $("#delete_row").click(function() {
                if (i > 1) {
                    $("#addr" + (i - 1)).html('');
                    i--;
                }
                calc();
            });

            $(".product").on('change', function() {
                option_checker(this)
            });


            $('#tab_logic tbody').on('keyup change', function() {
                calc();
            });
            $('#tax').on('keyup change', function() {
                calc_total();
            });

        });

        function option_checker(id) {
            var myOption = $(id).val();
            var s = 0;
            $('#tab_logic tbody tr select').each(function(index, element) {
                var myselect = $(this).val();
                if (myselect == myOption) {
                    s += 1;
                }
            });
            if (s > 1) {
                alert(myOption + ' as been added already try new..')
            }
        }

        function option_list(id) {
            el = '#' + id;
            var myArray = ["Product 1", "Product 2", "Product 3", "Product 4"];
            var collect = '<option value="">Select Product</option>';
            for (var i = 0; i < myArray.length; i++) {
                collect += '<option value="' + myArray[i] + '">' + myArray[i] + '</option>';
            }
            $(el + " select").html(collect);
        }

        function calc() {
            $('#tab_logic tbody tr').each(function(i, element) {
                var html = $(this).html();

                var qty = $(this).find('.qty').val();
                var price = $(this).find('.price').val();
                $(this).find('.total').val(qty * price);

                calc_total();
            });
        }

        function calc_total() {
            total = 0;
            $('.total').each(function() {
                total += parseInt($(this).val());
            });
            $('#sub_total').val(total.toFixed(2));
            tax_sum = total / 100 * $('#tax').val();
            $('#tax_amount').val(tax_sum.toFixed(2));
            $('#total_amount').val((tax_sum + total).toFixed(2));
        }
}