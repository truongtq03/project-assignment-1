import javax.swing.*;
import java.awt.event.*;

public class MainActivity {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Sample Project");

        JButton btnHello = new JButton("Click Me");
        btnHello.setBounds(50, 50, 150, 40);
        btnHello.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "xin chào");
            }
        });

        JButton btnGoodbye = new JButton("Tạm biệt");
        btnGoodbye.setBounds(50, 90, 150, 40);
        btnGoodbye.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "tạm biệt");
            }
        });

        frame.add(btnHello);
        frame.add(btnGoodbye);
        frame.setSize(300, 200);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}