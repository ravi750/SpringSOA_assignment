public class AssignmentCallout {

    public static void fetchSampleData(){
        String endPoint = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endPoint);
        request.setMethod('GET');
        
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200){
                System.debug('Response=== '+response.getBody());
            } 
        }
        catch(Exception ex){
            System.debug('ex=== '+ex.getMessage());
        }
    }
}
