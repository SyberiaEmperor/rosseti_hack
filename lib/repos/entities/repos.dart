import 'dart:io';


class StatementRepos{
  String _incidentDescription;
  DateTime _incidentTime;
  List<File> _images;
  List<File> _videos;
  List<File> _documents;


  void setIncidentDescription(String incidentDescription){
    _incidentDescription=incidentDescription;
  }
   void setIncidentTime(DateTime incidentTime){
    _incidentTime=incidentTime;
  }
  
   
  String get incidentDescription=>_incidentDescription;
  DateTime get incidentTime=>_incidentTime;
  List<File> get images=>_images;
  List<File>get videos=>_videos;
  List<File> get documents=>_documents;

  StatementRepos._(){
    _documents=[];
    _videos=[];
    _images=[];
    _incidentDescription="";
  }
  
  static StatementRepos _instance;
  static StatementRepos getInstance(){
    if(_instance==null){
      _instance=StatementRepos._();
    }
    return _instance;
  }
  
}