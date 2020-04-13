import java.util.ArrayList;
import java.util.Collections;
//import java.util.Scanner;

public class iRRSJF {
    static class Process implements Comparable {
        int arrivalTime, burstTime, serviceTime, turnAroundTime, waitingTime;
        public Process(int at, int bt) {
            arrivalTime = at;
            burstTime = bt;
            serviceTime = bt;
            turnAroundTime = 0;
            waitingTime = 0;
        }
        public int compareTo(Object t) {
            return burstTime - ((Process)t).burstTime;
        }
    }

    static void iRRSJF() {
        System.out.println("--- ROUND ROBIN WITH SHORTEST JOB FIRST using ARRIVAL TIME as TQ ---");
        // 1. Ready Queue
        ArrayList<Process> processes = new ArrayList<>();
//        Scanner sc = new Scanner(System.in);
        System.out.print("number of processes: 5 \n");
        int[] noOfProcesses = {0, 1, 2, 3, 4};
        int n = noOfProcesses.length;

//      Enter number of process
//        int n = sc.nextInt();
        double tq = 0;
        double totalTurnAroundTime = 0, totalWaitingTime = 0;
        for (int i = 0; i < n; i++) {
//            System.out.print("Enter arrival time for process[" + i + "]: ");

//          2. Enter Arrival Time
//            int at = sc.nextInt();

//            Arrival Time of the all processes
//            # TEST CASE 1:
            int at[] = {1, 3, 20, 31, 70};
//            # TEST CASE 2:
//             int at[] = {1, 11, 54, 88, 92};
//            # TEST CASE 3:
//             int at[] = {54, 11, 17, 32, 70};
//            # TEST CASE 4:
//            int at[] = {1, 4, 10, 30, 34};

//            System.out.print("Enter burst time for process[" + i + "]: ");

//          2. Enter Burst Time
//            int bt = sc.nextInt();

//             Burst Time of the all processes
//            # TEST CASE 1:
            int bt[] = {80, 29, 40, 17, 12};
//            # TEST CASE 2:
//             int bt[] = {22, 35, 52, 80, 77};
//            # TEST CASE 3:
//             int bt[] = {34, 58, 79, 98, 101};
//            # TEST CASE 4:
//            int bt[] = {20, 15, 10, 40, 30};

//          3. Add Processes to Ready Queue
            processes.add(new Process(at[i], bt[i]));
        }
//      4. Sort Ready Queue by SJF
        Collections.sort(processes);
        int time = 0;
        while (true) {
            boolean isDone = true, assigned = false;
            for (int i = 0; i < n; i++) {
                if (!assigned && processes.get(i).serviceTime > 0) {
                    assigned = true;
                    //5. Assign TQ
                    tq = processes.get(i).arrivalTime;
                    System.out.println("TQ = " + tq);
                }
                //6. Execute ready queue
                if (processes.get(i).serviceTime >= tq) {
                    time += tq;
                    processes.get(i).serviceTime -= tq;
                    isDone = false;
                    processes.get(i).turnAroundTime = time;
                    processes.get(i).waitingTime = Math.max(0, time - processes.get(i).burstTime);
                    System.out.println("Process[" + i + "] TAT = " + processes.get(i).turnAroundTime);
                    System.out.println("Process[" + i + "] WT = " + processes.get(i).waitingTime);
                } else if (processes.get(i).serviceTime > 0) {
                    //7. "Remove" finished process
                    time += processes.get(i).serviceTime;
                    processes.get(i).serviceTime = 0;
                    processes.get(i).turnAroundTime = time;
                    processes.get(i).waitingTime = Math.max(0, time - processes.get(i).burstTime);
                    System.out.println("Process[" + i + "] TAT = " + processes.get(i).turnAroundTime);
                    System.out.println("Process[" + i + "] WT = " + processes.get(i).waitingTime);
                }
            }
            //8. If there is still process with BT, execute ready queue and set TQ
            if (isDone) {
                //9. No more remaining BT
                for (int i = 0; i < n; i++) {
                    totalTurnAroundTime += processes.get(i).turnAroundTime;
                    totalWaitingTime += processes.get(i).waitingTime;
                }
                System.out.println("AverageTurnAroundTime = " + (totalTurnAroundTime/n));
                System.out.println("AverageWaitingTime = " + (totalWaitingTime/n));
                break;
            }
        }
    }

    public static void main(String[] args) {
        iRRSJF();
    }
}
