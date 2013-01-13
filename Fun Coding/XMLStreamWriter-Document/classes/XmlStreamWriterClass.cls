public with sharing class XmlStreamWriterClass {

	public String getXml(){

		XmlStreamWriter w = new XmlStreamWriter();
		w.writeStartDocument(null, '1.0');
		w.writeProcessingInstruction('target','data');
		w.writeStartElement('m','Library','http://www.books.com');
		w.writeNamespace('m','http://www.books.com');
		w.writeComment('Book starts here');
		w.setDefaultNamespace('http://www.defns.com');
		w.writeCdata('<Cdata> I Like Cdata </Cdata>');
		w.writeStartElement(null, 'book',null);
		w.writeDefaultNamespace('http://www.defns.com');
		w.writeAttribute(null, null, 'Author', 'Manoj');
		w.writeCharacters('This is my Book');
		w.writeEndElement();//End Book 
		w.writeEmptyElement(null,'ISBN',null);
		w.writeEndElement();//End Book
		w.writeEndDocument();
		String xmlOutput = 	w.getXmlString();
		w.close();

		return xmlOutput;

	}

	public Document createDocument() {

		String n = getXml();
		Document d = new Document();
		d.Name = 'Abz XML';
		d.body = Blob.valueOf(n);
		d.ContentType = '.xml';
		d.IsPublic = true; 
		d.FolderId = '005b0000000YLfe';

		insert d; 

		return d; 
	}
	public static testMethod void basicTest(){

		XmlStreamWriterClass demo = new XmlStreamWriterClass();
		String result = demo.getXml();

		System.debug('XML >>> ' + ' ' + result); //Debugging Process

	}
}
