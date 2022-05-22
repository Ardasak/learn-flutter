class Sign{
  final String _signName;
  final String _signDate;
  final String _signDetail;
  final String _signSmallImage;
  final String _signLargeImage;

  get signName => this._signName;

  get signDate => this._signDate;

  get signDetail => this._signDetail;

  get signSmallImage => this._signSmallImage;

  get signLargeImage => this._signLargeImage;

  Sign(this._signName, this._signDate, this._signDetail, this._signSmallImage, this._signLargeImage);

  @override
  String toString() {
    return "\nBurç Adı: $_signName \n Burç Tarihi: $_signDate \n Burç Detayı: $_signDetail \n";
  }
}