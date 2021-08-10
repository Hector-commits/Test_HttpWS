codeunit 50351 "WS Listener"
{

    procedure CreateOneCustomer()
    var
        Customer: Record Customer;
    begin
        Customer.Init();
        Customer."No." := 'A';
        Customer.Name := 'My Customer Description';
        Customer.Insert();
    end;
}