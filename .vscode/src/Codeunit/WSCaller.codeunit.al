codeunit 50350 "WS Caller"
{
    procedure CreateBasicAuthHeader(UserName: Text; Password: Text): Text
    var
        TempBlob: Record TempBlob;
    begin
        TempBlob.WriteAsText(StrSubstNo('%1:%2', UserName, Password), TextEncoding::UTF8);
        exit(StrSubstNo('Basic %1', TempBlob.ToBase64String()));
    end;

    procedure CallService(RequestUrl: Text; RequestType: Enum "Http Request Type"; payload: Text; Username: Text; Password: Text): Text
    var
        Client: HttpClient;
        RequestHeaders: HttpHeaders;
        RequestContent: HttpContent;
        ResponseMessage: HttpResponseMessage;
        RequestMessage: HttpRequestMessage;
        ResponseText: Text;
        contentHeaders: HttpHeaders;
    begin

        RequestHeaders := Client.DefaultRequestHeaders();
        RequestHeaders.Add('Authorization', CreateBasicAuthHeader(Username, Password));

        case RequestType of
            RequestType::GET:
                Client.Get(RequestURL, ResponseMessage);
            RequestType::PATCH:
                begin
                    RequestContent.WriteFrom(payload);

                    RequestContent.GetHeaders(contentHeaders);
                    contentHeaders.Clear();
                    contentHeaders.Add('Content-Type', 'application/json-patch+json');

                    RequestMessage.Content := RequestContent;

                    RequestMessage.SetRequestUri(RequestURL);
                    RequestMessage.Method := 'PATCH';

                    client.Send(RequestMessage, ResponseMessage);
                end;
            RequestType::POST:
                begin
                    RequestContent.WriteFrom(payload);

                    RequestContent.GetHeaders(contentHeaders);
                    contentHeaders.Clear();
                    contentHeaders.Add('Content-Type', 'application/json');

                    Client.Post(RequestURL, RequestContent, ResponseMessage);
                end;
            RequestType::DELETE:
                Client.Delete(RequestURL, ResponseMessage);
            RequestType::PUT:
                ;
        end;

        ResponseMessage.Content().ReadAs(ResponseText);
        exit(ResponseText);
    end;
}