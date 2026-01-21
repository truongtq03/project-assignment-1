import javax.swing.*;
import java.awt.event.*;

public class MainActivity {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Sample Project");

        JButton btn = new JButton("Click Me");
        btn.setBounds(50, 50, 150, 40);

        btn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "xin chào");
            }
        });

        frame.add(btn);
        frame.setSize(300, 200);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}