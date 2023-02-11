class DocumentModel {
  String? image;
  String? pdf;
  String? pages;
  bool? isCheck;
  DocumentModel({
    required this.image,
    required this.pdf,
    required this.pages,
    this.isCheck = false,
  });
}

List<DocumentModel> documentList = [
  DocumentModel(
    image: 'assets/images/spiral.jpg',
    pdf: 'Information.Pdf',
    pages: '3 pages',
    isCheck: true,
  ),
  DocumentModel(
    image: 'assets/images/spiral.jpg',
    pdf: 'Information.Pdf',
    pages: '3 pages',
  ),
  DocumentModel(
    image: 'assets/images/spiral.jpg',
    pdf: 'Information.Pdf',
    pages: '3 pages',
    isCheck: true,
  ),
];
