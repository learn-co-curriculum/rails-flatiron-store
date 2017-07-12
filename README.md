# Flatiron Store on Rails

We're going to build an e-commerce site! We're going to make an online store where users can browse items, put items in their carts, and buy items, which changes our inventory. We're eventually going to integrate the Stripe API to handle payments, and then integrate Segment.io to analyze user events.

***NOTE***: As with much of our Rails curriculum, remember to always use the `--no-test-framework` flag when you generate models, controllers, etc. That way, the Rails generators will not create additional tests on top of the test suite that already comes with the lesson. E.g., `rails g model User username:string email:string --no-test-framework`.

## First iteration

### Tasks:

1. Models and Associations
* Use the model tests to guide your model associations
* There's a seed file with some data generated with the Faker gem.
* Some hints:
  * We're going to treat our shopping cart like a session; a cart is instantiated and marked as a session when we add our first item to our cart.
  * line_items are like join tables between items and carts. They come into existance when we add an item to our cart.
  * Orders are instantiated during checkout and belong to a cart. They will act as a join table between a user and a cart.
  * an Item has a title, price (integer, in cents), and inventory (integer)
  * a Category has a title
  * a Line item has a quantity
  * an Order has a status and total (integer, in cents, which comes from the cart's total)

2. Functionality through class and instance methods and controller actions
  * Use the tests to guide basic functionality
  * Our Cart should be able to:
    * add the same item more than once; the line_item's quantity should change in this event
    * display a total given the price/quantity of all line_items (think about keeping this logic out of the views!).
  * A user can buy items that they put in their cart, which changes the inventory of the item. Actual purchase functionality will come later through Stripe.
  * When a user checks out, an order object should be created. An order should have a status of "submitted" when checkout is complete, and its total should be set from the cart's total.

3. Views for Program Flow
  * Add to cart buttons for each item
  * Navigation bar for visiting store home page and cart
  * Cart link should only be visible if user has added items to the cart (you should build helper methods in the `application_controller` to accomplish this)
  * Checkout link (checkout should be a POST request method on the carts controller)
  * Create a helper module in the `app/helpers` directory that will be used in our views to display our item prices and order and cart totals in a readable currency number (if the price is 4000 cents, display it as a readable 40.00).

## Up Next

Stripe integration and order flow

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/rails-flatiron-store' title='Flatiron Store on Rails'>Flatiron Store on Rails</a> on Learn.co and start learning to code for free.</p>
