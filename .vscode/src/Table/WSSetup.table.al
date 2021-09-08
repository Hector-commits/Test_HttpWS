table 50350 "WS Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(2; "Tenant Id"; Text[50])
        {
            Caption = 'Tenant Id';
            DataClassification = CustomerContent;
        }
        field(3; "Environment Name"; Text[50])
        {
            Caption = 'Environment Name';
            DataClassification = CustomerContent;
        }
        field(4; "Http Request Type"; Enum "Http Request Type")
        {
            Caption = 'Http Requets Type';
            DataClassification = CustomerContent;
        }
        field(10; "User Name"; Text[50])
        {
            Caption = 'User Name';
            DataClassification = CustomerContent;
        }
        field(11; "Password"; Text[80])
        {
            Caption = 'Password';
            DataClassification = CustomerContent;
        }
        field(50; "Web Service Name"; Text[50])
        {
            Caption = 'Web Service Name';
            DataClassification = CustomerContent;
        }
        field(51; "Method Name"; Text[50])
        {
            Caption = 'Method Name';
            DataClassification = CustomerContent;
        }
        field(60; "Company Name"; Text[50])
        {
            Caption = 'Company Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
