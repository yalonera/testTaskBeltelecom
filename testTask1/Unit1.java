/*
Задание:
Разработать консольное приложение, которое будет подсчитывать количество простых
чисел в диапазоне от 0 до максимального значения переменной int. При этом требуется
разработать максимально эффективный алгоритм. В конце выполнения приложение
должно вывести в консоль три параметра: полученное количество простых чисел,
продолжительность выполнения приложения, а так же процент простых чисел от
общего количества.
 */
public class Unit1 {
    public static void main(String[] args) {
        long startTime = System.nanoTime();
        int limit = Integer.MAX_VALUE;
        int primeNumberAmount = countPrimeNumbers(limit);
        System.out.println("Количество простых чисел: " + primeNumberAmount);
        System.out.println("Процент простых чисел от общего количества: "
                + getPercentPrimeNumbers(primeNumberAmount, limit));
        long endTime = System.nanoTime();
        double duration =(double) (endTime - startTime)/1000000000;
        System.out.println("Продолжительность выполнения приложения: " + duration);

    }

    protected static int getPercentPrimeNumbers(int counter, int maxValue) {
        return counter * 100 / maxValue;
    }

    protected static int countPrimeNumbers(int maxValue) {
        int counter = 0;
        for (int i = 0; i < maxValue; i++) {
            if (isPrime(i)) {
                counter++;
            }
        }
        return counter;
    }


    public static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }
        if (n == 2) {
            return true;
        }
        if (n % 2 == 0) {
            return false;
        }
        for (int i = 3; i <= Math.sqrt(n) + 1; i = i + 2) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}