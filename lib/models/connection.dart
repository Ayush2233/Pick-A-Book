import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:project2/models/book_model.dart';
import 'package:project2/models/post_model.dart';
import 'package:project2/models/user_model.dart';
import 'package:project2/models/sell_model.dart';
import 'package:project2/screens/Search.dart';
import 'package:project2/models/ratingModel.dart';


// Connection Constants

const Mongo_url = "mongodb+srv://project2:project2@pickabookdata.es9jtrh.mongodb.net/pickabook?retryWrites=true&w=majority";

// Collections
const userdata = "Users";
const books = "bookdata";
const post = "PostDetails";
const sell= 'sellList';
const wish='Wishlist';
const rating = 'ratings';

final User Fireuser = FirebaseAuth.instance.currentUser!;


class MongoDatabase{

  static var db, userCollection, bookCollection, postCollection, sellCollection,wishListCollection, ratingCollection;

  static connect() async{

    db = await Db.create(Mongo_url);

    await db.open();
    inspect(db);
    bookCollection = db.collection(books);
    userCollection = db.collection(userdata);
    postCollection = db.collection(post);
    sellCollection = db.collection(sell);
    wishListCollection = db.collection(wish);
    ratingCollection = db.collection(rating);
  }

  // Functions

  static Future<String> adduser(Usermap data) async{
    try{
      var results = await userCollection.insertOne(data.toJson());
      if(results.isSuccess){
        return "data inserted";
      }
      else{
        return "Something went wrong";
      }
    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> addPost(PostDisplay data) async {
    try {
      var results = await postCollection.insertOne(data.toJson());
      if (results.isSuccess) {
        return "data inserted";
      }
      else {
        return "data not inserted";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

    static Future<String> sellList(Sellmodel data) async{
      try {
        var results = await sellCollection.insertOne(data.toJson());
        if(results.isSuccess){
          return "data inserted";
        }
        else{
          return "data not inserted";
        }
      }catch(e){
        print(e.toString());
        return e.toString();
      }
    }

    static Future<String> addRatingList(RatingModel data) async
    {
    try{
      var results = await ratingCollection.insertOne(data.toJson());
      if(results.isSuccess){
        return "data inserted";
      }
      else {
        return "data not inserted";
      }

    }catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> fetchbooks() async
  {
    final result = await bookCollection.find(where.eq('book_average_rating', 3.5).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchnewbooks() async
  {
    final result = await bookCollection.find(where.gte('publication_year',2017).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchtopratedbooks() async
  {
    final result = await bookCollection.find(where.gte('book_average_rating',4.8)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchtrendbooks() async
  {
    final result = await bookCollection.find(where.gte('book_average_rating',4).gte('ratings_count', 1000).limit(100)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchmarvelbooks() async
  {
    final result = await bookCollection.find(where.eq("publisher","Marvel")).toList();
    return result;
  }


  static Future<List<Map<String, dynamic>>> fetchRomancebooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Romance").limit(50)).toList();
    return result;
  }
  static Future<List<Map<String, dynamic>>> fetchComicbooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Comic").gte('book_average_rating', 4).ne('publisher','Marvel' ).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchComicwithMarvelbooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Comic").gte('book_average_rating', 4).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchMysterybooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Mystery Thriller & Crime").gte('book_average_rating', 4).ne('publisher','Marvel').limit(50)).toList();
    return result;
  }
  static Future<Usermap> fetchUser() async
  {
    final result = await userCollection.findOne(where.eq("uid", Fireuser.uid));
    return Usermap.fromJson(result);
  }


  static Future<List<Map<String, dynamic>>> fetchFantbooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Fantasy & Paranormal").gte('book_average_rating', 4).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchYoungadultbooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Young Adult").gte('book_average_rating', 4).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchscholasticbooks() async
  {
    final result = await bookCollection.find(where.eq('publisher','Scholastic Inc').gt('book_average_rating', 3.7).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchChildrenbooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Children").gt('book_average_rating', 3.6).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchfantasybooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Fantasy & Paranormal").gt('book_average_rating', 3.6).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchHistorybooks() async
  {
    final result = await bookCollection.find(where.eq("genre","History & Biography").gt('book_average_rating', 3.6).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchPoetrybooks() async
  {
    final result = await bookCollection.find(where.eq("genre","Poetry").gt('book_average_rating', 3.6).gt('ratings_count', 500).limit(50)).toList();
    return result;
  }

      // .eq("genre","Poetry").gt('book_average_rating', 3.6).gt('ratings_count', 500).
  static Future<Usermap> fetchUserData(String uid) async
  {
    final result = await userCollection.findOne(where.eq("uid",uid ));
    final t = Usermap.fromJson(result);
    return t;
  }

  static Future<List<Map<String, dynamic>>> fetchPost() async{

    final pipeline = AggregationPipelineBuilder().addStage(Lookup(from: "Users", localField: "uid", foreignField: "uid", as: "result")).addStage(Sort({'time': -1})).build();
    final results = await DbCollection(db, "PostDetails").aggregateToStream(pipeline).toList();
    // print(results);
    // results.forEach(print);
    return results;
  }

  static Future<List<Map<String, dynamic>>> fetchBuybooks() async{

    final pipeline = AggregationPipelineBuilder().addStage(Lookup(from: "Users", localField: "uid", foreignField: "uid", as: "user")).build();
    final results = await DbCollection(db, "sellList").aggregateToStream(pipeline).toList();
    // print(results);
    // results.forEach(print);
    return results;
  }

  static Future<dynamic> updatepost(ObjectId pid) async{

    var u = await postCollection.findOne({"_id": pid});
    u['likes']+=1;
    await postCollection.save(u);
    return true;

  }

  static Future<List<Map<String, dynamic>>> fetsearch(String x) async{

    final result = await bookCollection.find(where.match('title', x,caseInsensitive:true).limit(200)).toList();
    // result.forEach(print);
    return result;
  }
  static Future<List<Map<String, dynamic>>> fetsellsearch(String x) async{

    final result = await sellCollection.find(where.match('title', x,caseInsensitive:true).limit(200)).toList();
    // result.forEach(print);
    return result;
  }

  static Future<List<Map<String, dynamic>>> fetchUserSellings() async{

    final results = await sellCollection.find(where.match("uid", Fireuser.uid)).toList();
    return results;
  }

  static Future<void> removeUserSelling(int bookid) async {
    await sellCollection.deleteOne(where.eq("book_id", bookid));
  }

  static Future<void> updateWishList(int a) async{
    await userCollection.updateOne(where.eq("uid", Fireuser.uid), modify.push('wishlist',a));
  }
  static Future<void> removeWishlistElement(int bookid) async{
    await userCollection.updateOne(where.eq("uid", Fireuser.uid), modify.pull('wishlist',bookid));
  }
  
  static Future<List<Map<String , dynamic>>> fetchWishList() async{
    final pipeline = AggregationPipelineBuilder().addStage(
        Match({"uid" : Fireuser.uid})).addStage(
        Unwind(Field("wishlist"))).addStage(
        Lookup(from: "bookdata", localField: "wishlist", foreignField: "book_id", as: "result")).build();

    final results = await DbCollection(db, "Users").aggregateToStream(pipeline).toList();
    return results;
  }

  static Future<void> updateRating(int book_id, double rating) async{
    var data = {"book_id": book_id, "rate": rating};
    await ratingCollection.updateOne(where.eq("uid", Fireuser.uid),
    modify.addToSet("ratings", data));
  }




}
