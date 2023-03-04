class NoteModel{
 late int id;
 late String title;
 late String subTitle;
 late int color;
 late String? date;

 NoteModel();

 NoteModel.fromMap(Map<String,dynamic> rowMap){
   id=rowMap["id"];
   title=rowMap["title"];
   subTitle=rowMap["subTitle"];
   color=rowMap["color"];
   date=rowMap["date"];
 }

 Map<String,dynamic> toMap(){
   Map<String,dynamic> rowMap = <String,dynamic>{};
   rowMap["title"] = title;
   rowMap["subTitle"] = subTitle;
   rowMap["color"] = color;
   rowMap["date"] = date;
   return rowMap;
 }

}