import '../models/craftsmen.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../sqflite/database_service.dart';

class CraftsmenRepository {
  final dbService = DatabaseService();

  // User methods
  Future<int> createUser(User user) => dbService.createUser(user);

  Future<List<User>> getAllUsers() => dbService.getUsers();

  Future<int> updateUser(User user) => dbService.updateUser(user);

  Future<int> deleteUser(int id) => dbService.deleteUser(id);

  // Craftsman methods

  Future<List<Craftsman>> getAllCraftsmen() => dbService.getCraftsmen();

  Future<int> createCraftsman(Craftsman craftsman) =>
      dbService.createCraftsman(craftsman);

  Future<List<Craftsman>> searchCraftsmen(String query) =>
      dbService.searchCraftsmen(query);

  Future<int> updateCraftsman(Craftsman craftsman) =>
      dbService.updateCraftsman(craftsman);

  // Review methods
  Future<int> createReview(Review review) => dbService.createReview(review);

  Future<List<Review>> getReviewsForCraftsman(int craftsmanId) =>
      dbService.getReviewsForCraftsman(craftsmanId);

  // Additional business logic methods

  Future<bool> userOwnsCraftsmanProfile(User user, Craftsman craftsman) async {
    // Check if user.id matches craftsman.userId

    // Get craftsman's user id
    int craftsmanUserId = await dbService.getUserIdForCraftsman(craftsman.id);

    // Compare to current user's id
    if (user.id == craftsmanUserId) {
      return true;
    } else {
      return false;
    }
  }

  Future<double> getAverageRatingForCraftsman(int craftsmanId) async {
    // Calculate average rating from reviews
    List<Review> reviews = await dbService.getReviewsForCraftsman(craftsmanId);

    if (reviews.isEmpty) {
      return 0;
    }

    double total = 0;

    for (var review in reviews) {
      total += review.rating;
    }

    return total / reviews.length;
  }

  
}
