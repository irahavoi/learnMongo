/**
 * Created by irahavoi on 6/14/2015.
 */
var products = db.products.find();

var categories = db.categories.find({_id: {$in: products['category_ids']}});
