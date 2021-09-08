page 50350 "WS Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "WS Setup";

    layout
    {
        area(Content)
        {
            group(Authentication)
            {
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the WS User Name';
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the WS user password';
                    ApplicationArea = All;
                }

            }
            group("Web Service address")
            {
                field("Tenant Id"; Rec."Tenant Id")
                {
                    ToolTip = 'Specifies the value of the Tenant Id field';
                    ApplicationArea = All;
                }
                field("Environment Name"; Rec."Environment Name")
                {
                    ToolTip = 'Specifies the value of the Environment Name field';
                    ApplicationArea = All;
                }
                field("Http Request Type"; Rec."Http Request Type")
                {
                    ToolTip = 'Specifies the value of the Http Requets Type field';
                    ApplicationArea = All;
                }
                field("Web Service Name"; Rec."Web Service Name")
                {
                    ToolTip = 'Specifies the value of the Web Service Name field';
                    ApplicationArea = All;
                }
                field("Method Name"; Rec."Method Name")
                {
                    ToolTip = 'Specifies the value of the Method Name field';
                    ApplicationArea = All;
                }
                field("Company Name"; "Company Name")
                {
                    ToolTip = 'Specifies the value of the GUID - Company Name we are calling at.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CallWS)
            {
                Caption = 'Call WS';
                ApplicationArea = All;
                ToolTip = 'Call WS';
                Image = Web;

                trigger OnAction()
                var
                    WSCaller: Codeunit "WS Caller";
                begin
                    Message(WSCaller.CallService(mountUrl(), Rec."Http Request Type", '', Rec."User Name", Rec.Password));
                end;
            }
            action(GetCompanies)
            {
                Caption = 'Get Companies';
                ApplicationArea = All;
                ToolTip = 'Get Companies';
                Image = Company;

                trigger OnAction()
                var
                    WSCaller: Codeunit "WS Caller";
                begin
                    Message(WSCaller.CallService(getCompaniesUrl(), Rec."Http Request Type", '', Rec."User Name", Rec.Password));
                end;
            }
        }
    }

    local procedure mountUrl() url: Text

    begin
        url := 'https://api.businesscentral.dynamics.com/v2.0/'
                + Rec."Tenant Id"
                + '/' + Rec."Environment Name"
                + '/' + 'ODataV4'
                + '/' + Rec."Web Service Name"
                + '_' + Rec."Method Name"
                + '?company={' + Rec."Company Name" + '}';
    end;

    local procedure getCompaniesUrl() url: Text
    begin
        url := 'https://api.businesscentral.dynamics.com/v2.0/'
            + Rec."Tenant Id"
            + '/' + Rec."Environment Name"
            + '/' + 'api'
            + '/' + 'microsoft/automation/v1.0/companies'
    end;
}