package business.order;

import api.ApiException;
import business.book.Book;
import business.book.BookDao;
import business.cart.ShoppingCart;
import business.customer.Customer;
import business.customer.CustomerDao;
import business.customer.CustomerForm;

import java.time.DateTimeException;
import java.time.YearMonth;
import java.util.Date;

import java.util.List;
import java.util.regex.Pattern;

public class DefaultOrderService implements OrderService {

	private BookDao bookDao;
	private OrderDao orderDao;
	private LineItemDao lineItemDao;
	private CustomerDao customerDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}

	@Override
	public OrderDetails getOrderDetails(long orderId) {
		Order order = orderDao.findByOrderId(orderId);
		Customer customer = customerDao.findByCustomerId(order.customerId());
		List<LineItem> lineItems = lineItemDao.findByOrderId(orderId);
		List<Book> books = lineItems
				.stream()
				.map(lineItem -> bookDao.findByBookId(lineItem.bookId()))
				.toList();
		return new OrderDetails(order, customer, lineItems, books);
	}

	@Override
    public long placeOrder(CustomerForm customerForm, ShoppingCart cart) {

		validateCustomer(customerForm);
		validateCart(cart);

		// NOTE: MORE CODE PROVIDED NEXT PROJECT

		return -1;
	}


	private void validateCustomer(CustomerForm customerForm) {

    	String name = customerForm.getName();

		if (name == null || name.equals("") || name.length() > 45) {
			throw new ApiException.ValidationFailure("name", "Invalid name field");
		}

		String address = customerForm.getAddress();

		if (address == null || address.equals("") || address.length() > 45) {
			throw new ApiException.ValidationFailure("address", "Invalid address field");
		}

		String phone = customerForm.getPhone();

		if (phone == null || phone.length()!=10) {
			throw new ApiException.ValidationFailure("phone", "Invalid phone field");
		}

		String email = customerForm.getEmail();

		if (email == null || !EMAIL_PATTERN.matcher(email).matches()) {
			throw new ApiException.ValidationFailure("email", "Invalid email field");
		}

		String ccNumber = customerForm.getCcNumber();

		if (ccNumber == null || ccNumber.length()!=16) {
			throw new ApiException.ValidationFailure("ccNumber", "Invalid ccNumber field");
		}

		if (expiryDateIsInvalid(customerForm.getCcExpiryMonth(), customerForm.getCcExpiryYear())) {
			throw new ApiException.ValidationFailure("Please enter a valid expiration date.");

		}
	}

	private boolean expiryDateIsInvalid(String ccExpiryMonth, String ccExpiryYear) {

		int expiryMonth = Integer.parseInt(ccExpiryMonth);
		int expiryYear = Integer.parseInt(ccExpiryYear);

		// Get the current YearMonth
		YearMonth currentYearMonth = YearMonth.now();

		// Create a YearMonth instance for the provided expiry date
		YearMonth expiryYearMonth = YearMonth.of(expiryYear, expiryMonth);

		// Check if the expiry date is before the current date
		return expiryYearMonth.isBefore(currentYearMonth);

	}

	private void validateCart(ShoppingCart cart) {

		if (cart.getItems() != null) {
			if (cart.getItems().size() == 0) {
				throw new ApiException.ValidationFailure("Cart is empty.");
			}

			cart.getItems().forEach(item -> {
				if (item.getQuantity() < 1 || item.getQuantity() > 99) {
					throw new ApiException.ValidationFailure("Invalid quantity");
				}

				Book databaseBook = bookDao.findByBookId(item.getBookId());
				// TODO: complete the required validations
			});
		}
	}

	private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
}
