public class XMLDocumentClass {
    
    public String getXml(){
        
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument(null, '1.0');
        w.writeStartElement(null,'account', null);
        
        for (account a : [Select Id, Name from Account]){
            
            w.writeStartElement(null,'id',null);
            w.writeCharacters(String.valueOf(a.Id));
            w.writeEndElement();
            w.writeStartElement(null,'name',null);
            w.writeCharacters(a.name);
            w.writeEndElement();
        }
        w.writeEndElement();
        w.writeEndDocument();
        String xml = w.getXmlString();
         w.close();
        return xml;
    }

    public Document createDocument() {

        String n = getXml();
        Folder f = [Select Id from Folder where Name = 'Shared Documents'];
        Document d = new Document();
        d.Name = 'Account XML';
        d.body = Blob.valueOf(n);
        d.ContentType = '.xml';
        d.IsPublic = true; 
        d.FolderId = f.Id;
        
        insert d; 
        return d; 
    }
    
    private static testMethod void basicTest(){
    
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        XMLDocumentClass demo = new XMLDocumentClass();
        Document d = demo.createDocument();
        String result = demo.getXml();
        Blob b = d.body;
        
        System.assertEquals(result, b.toString()); 
    
    }

}